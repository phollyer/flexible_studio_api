package api.browser.search
{
	import api.browser.Browser;

	import api.events.browser.search.SearchEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Open the URL defined as the browser search window. This is the same as pressing the Search button in Internet Explorer and will trigger an OnNavigate event.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_search.html Northcode Help Documentation
	*/
	public class Search extends Browser
	{
		/**
		* Constructor for Browser.Search()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_search.html Northcode Help Documentation
		*/
		public function Search(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Open the URL defined as the browser search window. This is the same as pressing the Search button in Internet Explorer and will trigger an OnNavigate event.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_search.html Northcode Help Documentation
		*/
		public function search():void
		{
			ssCore.Browser.search( {} , {callback:actionComplete, errorSTR:"searchError", code:"10023"} );
		}
	}
}