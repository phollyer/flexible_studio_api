package api.fileSys.getTimeStamp
{	
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.getTimeStamp.GetTimeStampEvent;
	import api.fileSys.FileSys;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.getTimeStamp.GetTimeStampEvent")]
	[Bindable]
	public class GetTimeStamp extends FileSys
	{		
		// Optional
		public var useUTC:Boolean = false;
		 
		// Required
		public var path:String = null;
		
		// Result
		public var timeStamp:String = null;
		
		public function GetTimeStamp(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getTimeStamp( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.getTimeStamp( {path:path , useUTC:useUTC}
												,{callback:actionComplete, errorSTR:"getTimeStampError", code:"9001"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			timeStamp = r.result;
			
			var e : GetTimeStampEvent = new GetTimeStampEvent( GetTimeStampEvent.RESULT );
			e.timeStamp = timeStamp;
			dispatchEvent( e );
		}
		
	}
}