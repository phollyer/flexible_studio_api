package api.tcp.close
{
	import api.events.tcp.close.CloseEvent;

	import api.tcp.Tcp;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Closes the socket opened in TCP.open or TCP.listen.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_close.html Northcode Help Documentation
	*/
	public class Close extends Tcp
	{		
		/**
		* Constructor for Tcp.Close()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_close.html Northcode Help Documentation
		*/
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Closes the socket opened in TCP.open or TCP.listen.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_TCP_close.html Northcode Help Documentation
		*/
		public function close():void
		{
			ssCore.Tcp.close( {}
							 ,{callback:actionComplete, errorSTR:"closeError", code:"40000"} );
		}
	}
}