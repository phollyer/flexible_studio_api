package api.http.read
{
	import api.events.http.read.ReadEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_read.html Northcode Help Documentation
	*/
	public class Read extends Http
	{
		/**
		* Constructor for Http.Read()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_read.html Northcode Help Documentation
		*/
		public function Read(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_read.html Northcode Help Documentation
		*/
		public function read():void
		{
			ssCore.Http.read( {}
							 ,{callback:actionComplete, errorSTR:"readError", code:"4004"} );
		}
	}
}