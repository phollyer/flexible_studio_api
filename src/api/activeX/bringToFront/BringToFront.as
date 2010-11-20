package api.activeX.bringToFront
{
	import api.activeX.ActiveX;

	import api.events.activeX.bringToFront.BringToFrontEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_bringToFront.html Northcode Help Documentation
	 */
	public class BringToFront extends ActiveX
	{
		
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * Constructor for ActiveX.BringToFront()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_bringToFront.html Northcode Help Documentation
		 */
		public function BringToFront(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 *
		 *
                 *
		 * @param activeXObject
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_bringToFront.html Northcode Help Documentation
		 */
		public function bringToFront( activeXObject:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					ssCore.ActiveX.bringToFront( {object:object} , {callback:actionComplete, errorSTR:"bringToFrontError", code:"15001"} );
			}
		}
	}
}