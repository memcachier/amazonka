{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.RDS.ModifyOptionGroup
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Modifies an existing option group.
--
-- <http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_ModifyOptionGroup.html>
module Network.AWS.RDS.ModifyOptionGroup
    (
    -- * Request
      ModifyOptionGroup
    -- ** Request constructor
    , modifyOptionGroup
    -- ** Request lenses
    , mogOptionsToInclude
    , mogOptionsToRemove
    , mogApplyImmediately
    , mogOptionGroupName

    -- * Response
    , ModifyOptionGroupResponse
    -- ** Response constructor
    , modifyOptionGroupResponse
    -- ** Response lenses
    , mogrsOptionGroup
    , mogrsStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.RDS.Types
import           Network.AWS.Request
import           Network.AWS.Response

-- |
--
-- /See:/ 'modifyOptionGroup' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'mogOptionsToInclude'
--
-- * 'mogOptionsToRemove'
--
-- * 'mogApplyImmediately'
--
-- * 'mogOptionGroupName'
data ModifyOptionGroup = ModifyOptionGroup'
    { _mogOptionsToInclude :: !(Maybe [OptionConfiguration])
    , _mogOptionsToRemove  :: !(Maybe [Text])
    , _mogApplyImmediately :: !(Maybe Bool)
    , _mogOptionGroupName  :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ModifyOptionGroup' smart constructor.
modifyOptionGroup :: Text -> ModifyOptionGroup
modifyOptionGroup pOptionGroupName_ =
    ModifyOptionGroup'
    { _mogOptionsToInclude = Nothing
    , _mogOptionsToRemove = Nothing
    , _mogApplyImmediately = Nothing
    , _mogOptionGroupName = pOptionGroupName_
    }

-- | Options in this list are added to the option group or, if already
-- present, the specified configuration is used to update the existing
-- configuration.
mogOptionsToInclude :: Lens' ModifyOptionGroup [OptionConfiguration]
mogOptionsToInclude = lens _mogOptionsToInclude (\ s a -> s{_mogOptionsToInclude = a}) . _Default . _Coerce;

-- | Options in this list are removed from the option group.
mogOptionsToRemove :: Lens' ModifyOptionGroup [Text]
mogOptionsToRemove = lens _mogOptionsToRemove (\ s a -> s{_mogOptionsToRemove = a}) . _Default . _Coerce;

-- | Indicates whether the changes should be applied immediately, or during
-- the next maintenance window for each instance associated with the option
-- group.
mogApplyImmediately :: Lens' ModifyOptionGroup (Maybe Bool)
mogApplyImmediately = lens _mogApplyImmediately (\ s a -> s{_mogApplyImmediately = a});

-- | The name of the option group to be modified.
--
-- Permanent options, such as the TDE option for Oracle Advanced Security
-- TDE, cannot be removed from an option group, and that option group
-- cannot be removed from a DB instance once it is associated with a DB
-- instance
mogOptionGroupName :: Lens' ModifyOptionGroup Text
mogOptionGroupName = lens _mogOptionGroupName (\ s a -> s{_mogOptionGroupName = a});

instance AWSRequest ModifyOptionGroup where
        type Sv ModifyOptionGroup = RDS
        type Rs ModifyOptionGroup = ModifyOptionGroupResponse
        request = post
        response
          = receiveXMLWrapper "ModifyOptionGroupResult"
              (\ s h x ->
                 ModifyOptionGroupResponse' <$>
                   (x .@? "OptionGroup") <*> (pure (fromEnum s)))

instance ToHeaders ModifyOptionGroup where
        toHeaders = const mempty

instance ToPath ModifyOptionGroup where
        toPath = const "/"

instance ToQuery ModifyOptionGroup where
        toQuery ModifyOptionGroup'{..}
          = mconcat
              ["Action" =: ("ModifyOptionGroup" :: ByteString),
               "Version" =: ("2014-10-31" :: ByteString),
               "OptionsToInclude" =:
                 toQuery
                   (toQueryList "OptionConfiguration" <$>
                      _mogOptionsToInclude),
               "OptionsToRemove" =:
                 toQuery
                   (toQueryList "member" <$> _mogOptionsToRemove),
               "ApplyImmediately" =: _mogApplyImmediately,
               "OptionGroupName" =: _mogOptionGroupName]

-- | /See:/ 'modifyOptionGroupResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'mogrsOptionGroup'
--
-- * 'mogrsStatus'
data ModifyOptionGroupResponse = ModifyOptionGroupResponse'
    { _mogrsOptionGroup :: !(Maybe OptionGroup)
    , _mogrsStatus      :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ModifyOptionGroupResponse' smart constructor.
modifyOptionGroupResponse :: Int -> ModifyOptionGroupResponse
modifyOptionGroupResponse pStatus_ =
    ModifyOptionGroupResponse'
    { _mogrsOptionGroup = Nothing
    , _mogrsStatus = pStatus_
    }

-- | FIXME: Undocumented member.
mogrsOptionGroup :: Lens' ModifyOptionGroupResponse (Maybe OptionGroup)
mogrsOptionGroup = lens _mogrsOptionGroup (\ s a -> s{_mogrsOptionGroup = a});

-- | FIXME: Undocumented member.
mogrsStatus :: Lens' ModifyOptionGroupResponse Int
mogrsStatus = lens _mogrsStatus (\ s a -> s{_mogrsStatus = a});