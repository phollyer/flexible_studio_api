package api.keyboard.notifiers
{
	import api.events.keyboard.notifiers.OnHotKeyEvent;

	import api.keyboard.Keyboard;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.keyboard.notifiers.OnHotKeyEvent.RESULT
	*/
	[Event(name="result", type="api.events.keyboard.onHotKey.OnHotKeyEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_onHotKey.html Northcode Help Documentation
	*/
	public class OnHotKey extends Keyboard
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var keyName:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var key:String = null;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var alt:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var ctrl:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var shift:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var win:Boolean = false;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var hotKeyName:String = null
		
		/**
		* Constructor for Keyboard.OnHotKey()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_onHotKey.html Northcode Help Documentation
		*/
		public function OnHotKey(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_onHotKey.html Northcode Help Documentation
		*/
		public function onHotKey():void
		{
			var __o:Object = new Object();
			__o.events = "onHotKey";
			__o.alt = convertBooleanToBinary( alt );
			__o.ctrl = convertBooleanToBinary( ctrl );
			__o.shift = convertBooleanToBinary( shift );
			__o.win = convertBooleanToBinary( win );
			
			switch( keyName != null )
			{
				case true:
					__o.keyName = keyName;
			}
			switch( key != null )
			{
				case true:
					__o.key = key;
			}
			ssCore.Keyboard.setNotify( __o
									 ,{callback:actionComplete, errorSTR:"onHotKeyError", code:"25011"} );
		}	
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			hotKeyName = r.result;
			
			var e : OnHotKeyEvent = new OnHotKeyEvent( OnHotKeyEvent.RESULT );
			e.hotKeyName = hotKeyName;
			dispatchEvent( e );
		}
	}
}