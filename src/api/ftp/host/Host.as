package api.ftp.host
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;
	
	[Event(name="missingHost" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Host extends Ftp
	{		
		// Required
		public var host:String = null;
		
		public function Host(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setHost( hostSTR:String = null ):void
		{
			host = compareStrings( hostSTR , host );
			
			switch( host )
			{
				case null:
					missingHost();
					break;
				default:
					ssCore.Ftp.host( {host:host}
									,{callback:actionComplete, errorSTR:"hostError", code:"7004"} );
			}
		}
	}
}