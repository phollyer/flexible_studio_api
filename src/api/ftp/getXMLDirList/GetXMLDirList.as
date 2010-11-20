package api.ftp.getXMLDirList
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.ftp.getXMLDirList.GetXMLDirListEvent;
	import api.ftp.Ftp;
	
	[Event(name="result", type="api.events.ftp.getXMLDirList.GetXMLDirListEvent")]
	[Bindable]
	public class GetXMLDirList extends Ftp
	{
		// Result
		public var xml:XML = new XML();
		
		public function GetXMLDirList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getXMLDirList():void
		{
			ssCore.Ftp.getXMLDirList( {}
									 ,{callback:actionComplete, errorSTR:"getXMLDirListError", code:"7017"} );
		}
		override protected function sendResult( r:Object ):void
		{
			xml = new XML( r.result );
			
			var e : GetXMLDirListEvent = new GetXMLDirListEvent( GetXMLDirListEvent.RESULT )
			e.xml = xml;
			dispatchEvent( e );
		}
	}
}