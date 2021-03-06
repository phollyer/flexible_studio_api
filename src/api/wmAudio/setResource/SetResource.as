package api.wmAudio.setResource
{
	import api.events.wmAudio.setResource.SetResourceEvent;

	import api.wmAudio.WmAudio;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>resource</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_RESOURCE
	*/
	[Event(name="missingResource", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Specify the resource for playback. This must be done before calling WMAudio.play.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setResource.html Northcode Help Documentation
	*/
	public class SetResource extends WmAudio
	{
		// Required
		/**
		* Any valid URL or local file specification. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var resource:String = null;
		
		/**
		* Constructor for WmAudio.SetResource()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setResource.html Northcode Help Documentation
		*/
		public function SetResource(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Specify the resource for playback. This must be done before calling WMAudio.play.
		*
		*
		* @param videoResource
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_WMAudio_setResource.html Northcode Help Documentation
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
					ssCore.WmAudio.setResource( {resource:resource}
											   ,{callback:actionComplete, errorSTR:"setResourceError", code:"46008"} );
			}
		}
	}
}