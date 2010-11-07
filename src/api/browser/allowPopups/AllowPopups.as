package api.browser.allowPopups
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class AllowPopups extends Browser
	{
		public var allowPopUps:Boolean = true;
		
		public function AllowPopups(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function allow():void
		{
			allowPopUps = true;
			setPopUps();
		}
		public function deny():void
		{
			allowPopUps = false;
			setPopUps();
		}
		private function setPopUps():void
		{
			ssCore.Browser.allowPopups( {flag:allowPopUps} , {callback:actionComplete, errorSTR:"allowPopupsError", code:"10003"} );
		}
	}
}