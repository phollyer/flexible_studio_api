package api.script.destroy
{
	import flash.events.IEventDispatcher;
	import api.script.Script;

	[Event(name="missingModule" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class Destroy extends Script
	{
		// Required
		public var module:String = null;
		
		public function Destroy(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function destroy( moduleName:String = null ):void
		{
			module = compareStrings( moduleName , module );
			
			switch( module )
			{
				case null:
					missingModule();
					break;
				default:
					ssCore.Script.destroy( {module:module}
										,{callback:actionComplete, errorSTR:"destroyError", code:"35003"} );
			}
		}
	}
}