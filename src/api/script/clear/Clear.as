package api.script.clear
{
	import api.events.script.clear.ClearEvent;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_clear.html Northcode Help Documentation
	*/
	public class Clear extends Script
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var module:String = null;
		
		/**
		* Constructor for Script.Clear()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_clear.html Northcode Help Documentation
		*/
		public function Clear(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param moduleName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_clear.html Northcode Help Documentation
		*/
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