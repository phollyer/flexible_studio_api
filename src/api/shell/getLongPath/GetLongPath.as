package api.shell.getLongPath
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.shell.getLongPath.GetLongPathEvent;
	import api.shell.Shell;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.shell.getLongPath.GetLongPathEvent")]
	[Bindable]
	public class GetLongPath extends Shell
	{				
		// Required
		public var path:String = null;
		
		// Result
		public var longPath:String = null;
		
		public function GetLongPath(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getLongPath( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Shell.getLongPath( {path:path}
											 ,{callback:actionComplete, errorSTR:"getLongPathError", code:"3002"} );
			}		
		}
		override protected function sendResult( r:Object ):void
		{
			longPath = r.result;
			
			var e : GetLongPathEvent = new GetLongPathEvent( GetLongPathEvent.RESULT );
			e.longPath = longPath;
			dispatchEvent( e );
		}
	}
}