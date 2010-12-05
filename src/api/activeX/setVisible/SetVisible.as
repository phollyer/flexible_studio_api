package api.activeX.setVisible
{
	import api.activeX.ActiveX;

	import api.events.activeX.setVisible.SetVisibleEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 * Set the visibility of the ActiveX control window.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setVisible.html Northcode Help Documentation
	 */
	public class SetVisible extends ActiveX
	{
		/**
		 * The name of the ActiveX object used in the call to createObject.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * Specifies whether the ActiveX control window should be visible or not. Valid values include: false and true.
		 *
		 * @defaultValue <code>true</code>
		 */
		public var visible:Boolean = true;
		
		/**
		 * Constructor for ActiveX.SetVisible()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setVisible.html Northcode Help Documentation
		 */
		public function SetVisible(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Set the visibility of the ActiveX control window.
		 *
                 *
		 * @param activeXObject
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setVisible.html Northcode Help Documentation
		 */
		public function setVisible( activeXObject:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					ssCore.ActiveX.setVisible( {object:object , visible:visible}
											  ,{callback:actionComplete, errorSTR:"setVisibleError", code:"15014"} );
			}
		}
	}
}