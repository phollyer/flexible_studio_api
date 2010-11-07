package api.sysTools.killApp
{
	import flash.events.IEventDispatcher;
	import api.sysTools.SysTools;
	
	[Event(name="missingApplication" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class KillApp extends SysTools
	{
		// Optional
		public var force:Boolean = false;
		public var timeout:Number = 5000;
		
		// Required
		public var application:String = null;
		
		public function KillApp(target:IEventDispatcher=null)
		{
			super(target);
		}
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