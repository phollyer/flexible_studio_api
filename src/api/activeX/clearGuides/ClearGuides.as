package api.activeX.clearGuides
{
	import api.activeX.ActiveX;

	import api.events.activeX.clearGuides.ClearGuidesEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 * Stop using guides for automatic resizing of the ActiveX object.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_clearGuides.html Northcode Help Documentation
	 */
	public class ClearGuides extends ActiveX
	{		
		/**
		 * The name of the ActiveX object used in the call to createObject.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * Constructor for ActiveX.ClearGuides()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_clearGuides.html Northcode Help Documentation
		 */
		public function ClearGuides(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Stop using guides for automatic resizing of the ActiveX object.
		 *
                 *
		 * @param activeXObject
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