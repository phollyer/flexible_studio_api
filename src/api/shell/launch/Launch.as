package api.shell.launch
{
	import api.events.shell.launch.LaunchEvent;

	import api.shell.Shell;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_launch.html Northcode Help Documentation
	*/
	public class Launch extends Shell
	{		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var resource:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var type:String = null;
		
		/**
		* Constructor for Shell.Launch()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_launch.html Northcode Help Documentation
		*/
		public function Launch(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_launch.html Northcode Help Documentation
		*/
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