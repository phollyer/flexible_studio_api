package api.shell.getDefaultApplication
{
	import api.events.shell.getDefaultApplication.GetDefaultApplicationEvent;

	import api.shell.Shell;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.shell.getDefaultApplication.GetDefaultApplicationEvent.RESULT
	*/
	[Event(name="result", type="api.events.shell.getDefaultApplication.GetDefaultApplicationEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_getDefaultApplication.html Northcode Help Documentation
	*/
	public class GetDefaultApplication extends Shell
	{				
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var extension:String = null;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var useFileExts:Boolean = false;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var applicationPath:String = null;
		
		/**
		* Constructor for Shell.GetDefaultApplication()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_getDefaultApplication.html Northcode Help Documentation
		*/
		public function GetDefaultApplication(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_getDefaultApplication.html Northcode Help Documentation
		*/
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			applicationPath = r.result;
			
			var e : GetDefaultApplicationEvent = new GetDefaultApplicationEvent( GetDefaultApplicationEvent.RESULT );
			e.applicationPath = applicationPath;
			dispatchEvent( e );
		}
	}
}