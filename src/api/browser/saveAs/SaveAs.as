package api.browser.saveAs
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class SaveAs extends Browser
	{
		public function SaveAs(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function saveAs():void
		{
			ssCore.Browser.saveAs( {} , {callback:actionComplete, errorSTR:"saveAsError", code:"10022"} );
		}
	}
}