package api.fileSys.getAttrs
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.getAttrs.GetAttrsEvent;
	import api.fileSys.FileSys;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.getAttrs.GetAttrsEvent")]
	[Bindable]
	public class GetAttrs extends FileSys
	{
		// Required
		public var path:String = null;
		
		// Result;
		public var attrs:String = null;
		
		public function GetAttrs(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getAttrs( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.getAttrs( {path:path}
											,{callback:actionComplete, errorSTR:"getAttrsError", code:"9025"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			attrs = r.result;
			
			var e : GetAttrsEvent = new GetAttrsEvent( GetAttrsEvent.RESULT );
			e.attrs = attrs;
			dispatchEvent( e );
		}
	}
}