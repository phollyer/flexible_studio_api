package api.shell.launch
{
	import flash.events.IEventDispatcher;
	import api.shell.Shell;
	
	[Bindable]
	public class Launch extends Shell
	{		
		// Optional
		public var resource:String = null;
		public var type:String = null;
		
		public function Launch(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function launch():void
		{			
			var __o:Object = new Object();
			switch( resource != null )
			{
				case true:
					__o.resource = resource;
			}
			switch( type != null )
			{
				case true:
					__o.type = type;
			}
			ssCore.Shell.launch( __o
							   ,{callback:actionComplete, errorSTR:"launchError", code:"3005"} );
		}
	}
}