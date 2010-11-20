package api.ftp.getXMLDirList
{
	import api.events.ftp.getXMLDirList.GetXMLDirListEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.ftp.getXMLDirList.GetXMLDirListEvent.RESULT
	*/
	[Event(name="result", type="api.events.ftp.getXMLDirList.GetXMLDirListEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getXMLDirList.html Northcode Help Documentation
	*/
	public class GetXMLDirList extends Ftp
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var xml:XML = new XML();
		
		/**
		* Constructor for Ftp.GetXMLDirList()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getXMLDirList.html Northcode Help Documentation
		*/
		public function GetXMLDirList(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getXMLDirList.html Northcode Help Documentation
		*/
		public function getXMLDirList():void
		{
			ssCore.Ftp.getXMLDirList( {}
									 ,{callback:actionComplete, errorSTR:"getXMLDirListError", code:"7017"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			xml = new XML( r.result );
			
			var e : GetXMLDirListEvent = new GetXMLDirListEvent( GetXMLDirListEvent.RESULT )
			e.xml = xml;
			dispatchEvent( e );
		}
	}
}