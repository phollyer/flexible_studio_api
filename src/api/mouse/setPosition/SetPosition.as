package api.mouse.setPosition
{
	import flash.events.IEventDispatcher;
	import api.mouse.Mouse;
	
	[Bindable]
	public class SetPosition extends Mouse
	{
		public static const FLASH:String = "flash";
		public static const SCREEN:String = "screen";
		
		// Optional
		public var system:String = FLASH;
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setPosition():void
		{
			ssCore.Mouse.setPosition( {x:x , y:y , system:system}
									 ,{callback:actionComplete, errorSTR:"setPositionError", code:"29007"} );
		}
	}
}