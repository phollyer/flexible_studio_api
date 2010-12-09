package api.wmVideo.setResource
{
	import api.events.wmVideo.setResource.SetResourceEvent;

	import api.wmVideo.WmVideo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>resource</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_RESOURCE
	*/
	[Event(name="missingResource", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Specify the resource for playback. This must be done before calling WMVideo.play.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setResource.html Northcode Help Documentation
	*/
	public class SetResource extends WmVideo
	{
		// Required
		/**
		* Any valid URL or local file specification. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var resource:String = null;
		
		/**
		* Constructor for WmVideo.SetResource()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setResource.html Northcode Help Documentation
		*/
		public function SetResource(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Specify the resource for playback. This must be done before calling WMVideo.play.
		*
		*
		* @param videoResource
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMVideo_setResource.html Northcode Help Documentation
		*/
		public function setResource( videoResource:String = null ):void
		{
			resource = compareStrings( videoResource , resource );
			
			switch( resource )
			{
				case null:
					missingResource();
					break;
				default:
					ssCore.WmVideo.setResource( {resource:resource}
											   ,{callback:actionComplete, errorSTR:"setResourceError", code:"46013"} );
			}
		}
	}
}