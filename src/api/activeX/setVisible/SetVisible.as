package api.activeX.setVisible
{
	import flash.events.IEventDispatcher;
	
	import api.activeX.ActiveX;
	
	
	/**
	 * Dispatched when the call to the SWF Studio Method
	 * <code>ActiveX.setVisible()</code> has completed successfully.
	 * 
	 * @eventType api.events.activeX.setVisible.SetVisibleEvent.RESULT
	 */
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.setVisible.SetVisibleEvent.RESULT_OBJECT
	 */
	
	/**
	 * Dispatched when an Error has occured when trying to complete the SWF Studio Method.
	 * 
	 * @eventTYpe api.errors.ActiveXError.SET_VISIBLE_ERROR
	 */
	
	/**
	 * Toggle between making the ActiveX Object visible and not visible.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setVisible.html Northcode Help Documentation
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SetVisible extends ActiveX
	{
		/**
		 * The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @defaultValue <code>null</code>
		 */
		public var object:String = null;
		
		/**
		 * Flag to set the Visibility of the ActiveX Object
		 * 
		 * @defaultValue true
		 */
		public var visible:Boolean = true;
		
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