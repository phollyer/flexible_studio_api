package api.shell.open
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.shell.open.OpenEvent;
	import api.shell.Shell;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.shell.open.OpenEvent")]
	[Bindable]
	public class Open extends Shell
	{				
		// Optional
		public var extension:String = null;
		public var useFileExts:Boolean = false;
		
		// Required
		public var path:String = null;
		
		// Result
		public var applicationPath:String = null;
		
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function open( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					var __o:Object = new Object();
					__o.useFileExts = useFileExts;
					switch( extension != null )
					{
						case true:
							__o.extension = extension;
					}
					
					ssCore.Shell.open( __o
									 ,{callback:actionComplete, errorSTR:"openError", code:"3006"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			applicationPath = r.result;
			
			var e : OpenEvent = new OpenEvent( OpenEvent.RESULT );
			e.applicationPath = applicationPath;
			dispatchEvent( e );
		}
	}
}