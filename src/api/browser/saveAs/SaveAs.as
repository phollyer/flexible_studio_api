package api.browser.saveAs
{
	import api.browser.Browser;

	import api.events.browser.saveAs.SaveAsEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Display the Browser 'Save Web Page' dialog (the same effect you get after selecting Save As from the File menu in Internet Explorer).
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_saveAs.html Northcode Help Documentation
	*/
	public class SaveAs extends Browser
	{
		/**
		* Constructor for Browser.SaveAs()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_saveAs.html Northcode Help Documentation
		*/
		public function SaveAs(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Display the Browser 'Save Web Page' dialog (the same effect you get after selecting Save As from the File menu in Internet Explorer).
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_saveAs.html Northcode Help Documentation
		*/
		public function saveAs():void
		{
			ssCore.Browser.saveAs( {} , {callback:actionComplete, errorSTR:"saveAsError", code:"10022"} );
		}
	}
}