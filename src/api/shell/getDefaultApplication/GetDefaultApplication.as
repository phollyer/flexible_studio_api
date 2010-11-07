package api.shell.getDefaultApplication
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.shell.getDefaultApplication.GetDefaultApplicationEvent;
	import api.shell.Shell;
	
	[Event(name="result", type="api.events.shell.getDefaultApplication.GetDefaultApplicationEvent")]
	[Bindable]
	public class GetDefaultApplication extends Shell
	{				
		// Optional
		public var path:String = null;
		public var extension:String = null;
		public var useFileExts:Boolean = false;
		
		// Result
		public var applicationPath:String = null;
		
		public function GetDefaultApplication(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getDefaultApplication():void
		{
			var __o:Object = new Object();
			__o.useFileExts = useFileExts;
			
			switch( path != null )
			{
				case true:
					__o.path = path;
			}
			switch( extension != null )
			{
				case true:
					__o.extension = extension;
			}
			
			ssCore.Shell.getDefaultApplication( __o
									   		  ,{callback:actionComplete, errorSTR:"getDefaultApplicationError", code:"3001"} );
		}
		override protected function sendResult( r:Object ):void
		{
			applicationPath = r.result;
			
			var e : GetDefaultApplicationEvent = new GetDefaultApplicationEvent( GetDefaultApplicationEvent.RESULT );
			e.applicationPath = applicationPath;
			dispatchEvent( e );
		}
	}
}