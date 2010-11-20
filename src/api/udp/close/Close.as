package api.udp.close
{
	import api.events.udp.close.CloseEvent;

	import api.udp.Udp;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_close.html Northcode Help Documentation
	*/
	public class Close extends Udp
	{		
		/**
		* Constructor for Udp.Close()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_close.html Northcode Help Documentation
		*/
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_UDP_close.html Northcode Help Documentation
		*/
		public function close():void
		{
			ssCore.Udp.close( {}
							 ,{callback:actionComplete, errorSTR:"closeError", code:"44001"} );
		}
	}
}