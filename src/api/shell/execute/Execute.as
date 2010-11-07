package api.shell.execute
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.shell.execute.ExecuteEvent;
	import api.shell.Shell;
	import api.vos.shell.ExecuteVO;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.shell.execute.ExecuteEvent")]
	[Bindable]
	public class Execute extends Shell
	{		
		// Required
		public var settings:ExecuteVO = new ExecuteVO();
		
		// Results
		public var elapsed:Number = 0;
		public var exitCode:String = null;
		public var hwnd:String = null;
		public var output:String = null;
		public var pid:String = null;
		
		public function Execute(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function execute( filePath:String = null ):void
		{
			settings.path = compareStrings( filePath , settings.path );
			
			switch( settings.path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Shell.execute( settings.createObject()
									    ,{callback:actionComplete, errorSTR:"executeError", code:"3000"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			elapsed = Number( r.elapsed );
			exitCode = r.exitCode;
			hwnd = r.hwnd
			output = r.output;
			pid = r.pid;
			
			var e : ExecuteEvent = new ExecuteEvent( ExecuteEvent.RESULT );
			e.elapsed = elapsed;
			e.exitCode = exitCode;
			e.hwnd = hwnd;
			e.output = output;
			e.pid = pid;
			dispatchEvent( e );
		}
	}
}