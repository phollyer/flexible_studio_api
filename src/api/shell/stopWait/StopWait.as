package api.shell.stopWait
{
	import flash.events.IEventDispatcher;
	import api.shell.Shell;
	
	[Bindable]
	public class StopWait extends Shell
	{						
		public function StopWait(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function stopWait( filePath:String = null ):void
		{
			ssCore.Shell.stopWait( {}
								  ,{callback:actionComplete, errorSTR:"stopWaitError", code:"3008"} );
		}
	}
}