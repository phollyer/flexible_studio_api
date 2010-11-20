package api.browser.setAnchors
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class SetAnchors extends Browser
	{
		public var bottom:Number = 0;
		public var left:Number = 0;
		public var right:Number = 0;
		public var top:Number = 0;
		
		public function SetAnchors(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setAnchors():void
		{
			ssCore.Browser.setAnchors( {bottom:bottom
									   ,left:left
									   ,right:right
									   ,top:top} , {callback:actionComplete, errorSTR:"setAnchorsError", code:"10024"} );
		}
	}
}