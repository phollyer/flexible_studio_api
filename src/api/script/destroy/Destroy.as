package api.script.destroy
{
	import api.events.script.destroy.DestroyEvent;

	import api.script.Script;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>module</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_MODULE
	*/
	[Event(name="missingModule" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_destroy.html Northcode Help Documentation
	*/
	public class Destroy extends Script
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var module:String = null;
		
		/**
		* Constructor for Script.Destroy()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_destroy.html Northcode Help Documentation
		*/
		public function Destroy(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param moduleName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_destroy.html Northcode Help Documentation
		*/
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