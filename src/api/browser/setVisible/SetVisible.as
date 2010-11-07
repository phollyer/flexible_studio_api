package api.browser.setVisible
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class SetVisible extends Browser
	{
		public var flag:Boolean = false;
		
		public function SetVisible(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			flag = true;
			setVisible();
		}
		public function hide():void
		{
			flag = false;
			setVisible();
		}
		private function setVisible():void
		{
			ssCore.Browser.setVisible( {flag:flag} , {callback:actionComplete, errorSTR:"setVisibleError", code:"10040"} );
		}
	}
}