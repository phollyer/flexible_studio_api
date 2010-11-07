package api.activeX.destroyObject
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	
	
	/**
	 * Dispatched when the call to the SWF Studio Method
	 * <code>ActiveX.destroyObject()</code> has completed successfully.
	 * 
	 * @eventType api.events.activeX.destroyObject.DestroyObjectEvent.RESULT
	 */
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.destroyObject.DestroyObjectEvent.RESULT_OBJECT
	 */
	
	/**
	 * Dispatched when an Error has occured when trying to complete the SWF Studio Method.
	 * 
	 * @eventTYpe api.errors.ActiveXError.DESTROY_OBJECT_ERROR
	 */
	
	/**
	 * Remove an ActiveX Object that is embedded in your Application.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_destroyObject.html Northcode Help Documentation
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class DestroyObject extends ActiveX
	{		
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		public function DestroyObject(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Remove an ActiveX Object that is embedded in your Application.
		 * 
		 * @param activeXObject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
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