package api.shell.invoke
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.shell.invoke.InvokeEvent;
	import api.shell.Shell;
	import api.vos.shell.InvokeVO;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.shell.invoke.InvokeEvent")]
	[Bindable]
	public class Invoke extends Shell
	{		
		// Required
		public var settings:InvokeVO = new InvokeVO();
		
		// Results
		public var elapsed:Number = 0;
		public var exitCode:String = null;
		public var hwnd:String = null;
		
		public function Invoke(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function openFile( filePath:String = null ):void
		{			
			settings.path = compareStrings( filePath , settings.path );
			
			switch( settings.path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Shell.invoke( settings.createObject()
									   ,{callback:actionComplete, errorSTR:"invokeError", code:"3004"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			elapsed = Number( r.elapsed );
			exitCode = r.exitCode;
			hwnd = r.hwnd;
			
			var e: InvokeEvent = new InvokeEvent( InvokeEvent.RESULT );
			e.elapsed = elapsed;
			e.exitCode = exitCode;
			e.hwnd = hwnd;
			dispatchEvent( e );
		}
	}
}