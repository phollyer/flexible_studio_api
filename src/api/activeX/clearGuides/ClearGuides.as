package api.activeX.clearGuides
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	
	
	/**
	 * Dispatched when the call to the SWF Studio Method
	 * <code>ActiveX.clearGuides()</code> has completed successfully.
	 * 
	 * @eventType api.events.activeX.clearGuides.ClearGuidesEvent.RESULT
	 */
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.	 * 
	 * 
	 * @eventType api.events.activeX.clearGuides.ClearGuidesEvent.RESULT_OBJECT
	 */
	
	/**
	 * Dispatched when an Error has occured when trying to complete the SWF Studio Method.
	 * 
	 * @eventTYpe api.errors.ActiveXError.CLEAR_GUIDES_ERROR
	 */
	
	/**
	 * Clears any Guides set up for automatic re-sizing.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_clearGuides.html Northcode Help Documentation
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearGuides extends ActiveX
	{		
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		public function ClearGuides(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
	 	 * Clears any Guides set up for automatic re-sizing.
	 	 * 
	 	 * @param activeXObject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_clearGuides.html Northcode Help Documentation
		 */
		public function clearGuides( activeXObject:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					ssCore.ActiveX.clearGuides( {object:object} , {callback:actionComplete, errorSTR:"clearGuidesError", code:"15003"} );
			}
		}
	}
}