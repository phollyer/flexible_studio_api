package api.shell.resolveMoniker
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.shell.resolveMoniker.ResolveMonikerEvent;
	import api.shell.Shell;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.shell.resolveMoniker.ResolveMonikerEvent")]
	[Bindable]
	public class ResolveMoniker extends Shell
	{						
		// Required
		public var path:String = null;
		
		// Result
		public var fullPath:String = null;
		
		public function ResolveMoniker(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function resolveMoniker( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			ssCore.Shell.resolveMoniker( {path:path}
										,{callback:actionComplete, errorSTR:"resolveMonikerError", code:"3007"} );
		}
		override protected function sendResult( r:Object ):void
		{
			fullPath = r.result;
			
			var e : ResolveMonikerEvent = new ResolveMonikerEvent( ResolveMonikerEvent.RESULT );
			e.fullPath = fullPath;
			dispatchEvent( e );
		}
	}
}