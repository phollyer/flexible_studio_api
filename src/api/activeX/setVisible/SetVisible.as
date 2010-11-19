package api.activeX.setVisible
{
	import api.activeX.ActiveX;

	import api.events.activeX.setVisible.SetVisibleEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.setVisible.SetVisibleEvent.RESULT_OBJECT
	 */
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 * Toggle between making the ActiveX Object visible and not visible.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setVisible.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setVisible.html Northcode Help Documentation
	 */
	public class SetVisible extends ActiveX
	{
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * Flag to set the Visibility of the ActiveX Object
		 * 
		 * @defaultValue true
		 */
		/**
		 * 
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
		 * Toggle between making the ActiveX Object visible and not visible.
		 * 
		 * @param ativeXObject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setVisible.html Northcode Help Documentation
		 */
		/**
		 *
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