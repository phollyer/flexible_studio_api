package api.shell.getShortPath
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.shell.getShortPath.GetShortPathEvent;
	import api.shell.Shell;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.shell.getShortPath.GetShortPathEvent")]
	[Bindable]
	public class GetShortPath extends Shell
	{				
		// Required
		public var path:String = null;
		
		// Result
		public var shortPath:String = null;
		
		public function GetShortPath(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getShortPath( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Shell.getShortPath( {path:path}
											 ,{callback:actionComplete, errorSTR:"getShortPathError", code:"3003"} );
			}		
		}
		override protected function sendResult( r:Object ):void
		{
			shortPath = r.result;
			
			var e : GetShortPathEvent = new GetShortPathEvent( GetShortPathEvent.RESULT );
			e.shortPath = shortPath;
			dispatchEvent( e );
		}
	}
}