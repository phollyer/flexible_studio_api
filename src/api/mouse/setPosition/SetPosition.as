package api.mouse.setPosition
{
	import api.events.mouse.setPosition.SetPositionEvent;

	import api.mouse.Mouse;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_setPosition.html Northcode Help Documentation
	*/
	public class SetPosition extends Mouse
	{
		public static const FLASH:String = "flash";
		public static const SCREEN:String = "screen";
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>FLASH</code>
		*/
		public var system:String = FLASH;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var x:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var y:Number = 0;
		
		/**
		* Constructor for Mouse.SetPosition()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_setPosition.html Northcode Help Documentation
		*/
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_setPosition.html Northcode Help Documentation
		*/
		public function setPosition():void
		{
			ssCore.Mouse.setPosition( {x:x , y:y , system:system}
									 ,{callback:actionComplete, errorSTR:"setPositionError", code:"29007"} );
		}
	}
}