package api.browser.showBorder
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class ShowBorder extends Browser
	{
		public var _flag:Boolean = false;
		
		public function ShowBorder(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			_flag = true;
			setBorders();
		}
		public function hide():void
		{
			_flag = false;
			setBorders();
		}
		private function setBorders():void
		{
			ssCore.Browser.showBorder( {flag:_flag} , {callback:actionComplete, errorSTR:"showBorderError", code:"10041"} );
		}
	}
}