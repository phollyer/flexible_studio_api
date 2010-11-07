package api.browser.setPosition
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class SetPosition extends Browser
	{
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setPosition():void
		{
			ssCore.Browser.setPosition( {x:x , y:y} , {callback:actionComplete, errorSTR:"setPositionError", code:"10036"} );
		}
	}
}