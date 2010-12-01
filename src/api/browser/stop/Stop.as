package api.browser.stop
{
	import api.browser.Browser;

	import api.events.browser.stop.StopEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_stop.html Northcode Help Documentation
	*/
	public class Stop extends Browser
	{
		/**
		* Constructor for Browser.Stop()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_stop.html Northcode Help Documentation
		*/
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_stop.html Northcode Help Documentation
		*/
		public function stop():void
		{
			ssCore.Browser.stop( {} , {callback:actionComplete, errorSTR:"stopError", code:"10043"} );
		}
	}
}