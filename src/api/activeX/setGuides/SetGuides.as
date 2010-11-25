package api.activeX.setGuides
{
	import api.activeX.ActiveX;

	import api.events.activeX.setGuides.SetGuidesEvent;

	import api.vos.activeX.GuideVO;

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
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ActiveX_setGuides.html Northcode Help Documentation
	 */
	public class SetGuides extends ActiveX
	{
		/**
		 * 
		 *
		 * @defaultValue <code>new</code>
		 */
		public var guides:GuideVO = new GuideVO();
		
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