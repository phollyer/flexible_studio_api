package api.browser.allowDragDrop
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class AllowDragDrop extends Browser
	{		
		public var _allow:Boolean = true;
		
		public function AllowDragDrop(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function allow():void
		{
			_allow = true;
			setBrowser();
		}
		public function deny():void
		{
			_allow = false;
			setBrowser();
		}
		private function setBrowser():void
		{
			ssCore.Browser.allowDragDrop( {flag:_allow} , {callback:actionComplete, errorSTR:"allowDragDropError", code:"10001"} );			
		}
	}
}