package api.sysTools.killApp
{
	import api.events.sysTools.killApp.KillAppEvent;

	import api.sysTools.SysTools;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>application</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_APPLICATION
	*/
	[Event(name="missingApplication" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_killApp.html Northcode Help Documentation
	*/
	public class KillApp extends SysTools
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var force:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>5000</code>
		*/
		public var timeout:Number = 5000;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var application:String = null;
		
		/**
		* Constructor for SysTools.KillApp()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_killApp.html Northcode Help Documentation
		*/
		public function KillApp(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param app
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_killApp.html Northcode Help Documentation
		*/
		public function killApp( app:String = null ):void
		{
			application = compareStrings( app , application );
			
			switch( application )
			{
				case null:
					missingApplication();
					break;
				default:
					ssCore.SysTools.killApp( {application:application , force:force , timeout:timeout}
											,{callback:actionComplete, errorSTR:"killAppError", code:"39003"} );
			}
		}
	}
}