package api.keyboard.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.keyboard.notifiers.OnHotKeyEvent;
	import api.keyboard.Keyboard;

	[Event(name="result", type="api.events.keyboard.onHotKey.OnHotKeyEvent")]
	[Bindable]
	public class OnHotKey extends Keyboard
	{
		// Optional
		public var keyName:String = null;
		public var key:String = null;
		public var alt:Boolean = false;
		public var ctrl:Boolean = false;
		public var shift:Boolean = false;
		public var win:Boolean = false;
		
		// Result
		public var hotKeyName:String = null
		
		public function OnHotKey(target:IEventDispatcher=null)
		{
			super(target);
		}
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
		}		
		override protected function sendResult( r:Object ):void
		{
			hotKeyName = r.result;
			
			var e : OnHotKeyEvent = new OnHotKeyEvent( OnHotKeyEvent.RESULT );
			e.hotKeyName = hotKeyName;
			dispatchEvent( e );
		}
	}
}