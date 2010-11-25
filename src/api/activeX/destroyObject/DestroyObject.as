package api.activeX.destroyObject
{
	import api.activeX.ActiveX;

	import api.events.activeX.destroyObject.DestroyObjectEvent;

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
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_destroyObject.html Northcode Help Documentation
	 */
	public class DestroyObject extends ActiveX
	{		
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * Constructor for ActiveX.DestroyObject()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_destroyObject.html Northcode Help Documentation
		 */
		public function DestroyObject(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param activeXObject
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_destroyObject.html Northcode Help Documentation
		 */
		public function destroyObject( activeXObject:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					ssCore.ActiveX.destroyObject( {object:object}
												 ,{callback:actionComplete, errorSTR:"destroyObjectError", code:"15005"} );
			}
		}
	}
}