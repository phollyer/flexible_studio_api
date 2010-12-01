package api.http.stop
{
	import api.events.http.stop.StopEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_stop.html Northcode Help Documentation
	*/
	public class Stop extends Http
	{
		/**
		* Constructor for Http.Stop()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_stop.html Northcode Help Documentation
		*/
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_stop.html Northcode Help Documentation
		*/
		public function stop():void
		{			
			ssCore.Http.stop( {}
							 ,{callback:actionComplete, errorSTR:"stopError", code:"4006"} );
		}
	}
}