package api.browser.showScrollbars
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class ShowScrollbars extends Browser
	{
		public var flag:Boolean = false;
		
		public function ShowScrollbars(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			flag = true;
			setScrollBars();
		}
		public function hide():void
		{
			flag = false;
			setScrollBars();
		}
		private function setScrollBars():void
		{
			ssCore.Browser.showScrollbars( {flag:flag} , {callback:actionComplete, errorSTR:"showScrollbarsError", code:"10042"} );
		}
	}
}