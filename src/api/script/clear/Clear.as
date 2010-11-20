package api.script.clear
{
	import flash.events.IEventDispatcher;
	import api.script.Script;

	[Event(name="missingModule" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Clear extends Script
	{
		// Required
		public var module:String = null;
		
		public function Clear(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clear( moduleName:String = null ):void
		{
			module = compareStrings( moduleName , module );
			
			switch( module )
			{
				case null:
					missingModule();
					break;
				default:
					ssCore.Script.clear( {module:module}
										,{callback:actionComplete, errorSTR:"clearError", code:"35001"} );
			}
		}
	}
}