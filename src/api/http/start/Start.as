package api.http.start
{
	import api.events.http.start.StartEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Makes a connection to the host server using the supplied port, host, authentication, proxy (etc.) information.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_start.html Northcode Help Documentation
	*/
	public class Start extends Http
	{
		/**
		* Constructor for Http.Start()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_start.html Northcode Help Documentation
		*/
		public function Start(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		* Makes a connection to the host server using the supplied port, host, authentication, proxy (etc.) information.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_start.html Northcode Help Documentation
		*/
		public function start():void
		{
			ssCore.Http.start( {}
							  ,{callback:actionComplete, errorSTR:"startError", code:"4001"} );
		}
	}
}