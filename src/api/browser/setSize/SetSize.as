package api.browser.setSize
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class SetSize extends Browser
	{
		public var height:Number = 100;
		public var width:Number = 100;
		
		public function SetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setSize():void
		{
			ssCore.Browser.setSize( {height:height , width:width} , {callback:actionComplete, errorSTR:"setSizeError", code:"10038"} );
		}
	}
}