package api.activeX.setGuides
{
	import api.activeX.ActiveX;

	import api.events.activeX.setGuides.SetGuidesEvent;

	import api.vos.activeX.GuideVO;

	import flash.events.IEventDispatcher;	
	
	/**
	 * Dispatched when the Property <code>object</code> has not been supplied.
	 * 
	 * @eventType api.events.activeX.setGuides.SetGuidesEvent.RESULT_OBJECT
	 */
	/**
	 * Dispatched if the Property <code>object</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_OBJECT
	 */
	[Event(name="missingObject" , type="api.events.SWFStudioEvent")]
	
	[Bindable]
	/**
	 * Set up Guides that will be used to resize the ActiveX Object when you Application
	 * Window is re-sized.
	 * 
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setGuides.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setGuides.html Northcode Help Documentation
	 */
	public class SetGuides extends ActiveX
	{
		/**
		 * Value Object containing all the required Properties to set up the Guides.
		 * 
		 * @defaultValue new GuideVO()
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>new</code>
		 */
		public var guides:GuideVO = new GuideVO();
		
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
		 * Constructor for ActiveX.SetGuides()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setGuides.html Northcode Help Documentation
		 */
		public function SetGuides(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Set up Guides that will be used to resize the ActiveX Object when you Application
		 * Window is re-sized.
		 * 
		 * @param activeXObject The Object Identifier used in <code>createObject()</code> to identify
		 * the ActiveX Object.
		 * 
		 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setGuides.html Northcode Help Documentation
		 */
		/**
		 *
		 *
                 *
		 * @param activeXObject
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setGuides.html Northcode Help Documentation
		 */
		public function setGuides( activeXObject:String = null ):void
		{
			object = compareStrings( activeXObject , object );
			
			switch( object )
			{
				case null:
					missingObject();
					break;
				default:
					var __o:Object = new Object();
					__o = guides;
					__o.object = object;
					ssCore.ActiveX.setGuides( __o
											,{callback:actionComplete, errorSTR:"setGuidesError", code:"15010"} );
			}
		}
	}
}