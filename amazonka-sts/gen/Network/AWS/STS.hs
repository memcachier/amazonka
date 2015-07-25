{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.STS
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- AWS Security Token Service
--
-- The AWS Security Token Service (STS) is a web service that enables you
-- to request temporary, limited-privilege credentials for AWS Identity and
-- Access Management (IAM) users or for users that you authenticate
-- (federated users). This guide provides descriptions of the STS API. For
-- more detailed information about using this service, go to
-- <http://docs.aws.amazon.com/STS/latest/UsingSTS/Welcome.html Using Temporary Security Credentials>.
--
-- As an alternative to using the API, you can use one of the AWS SDKs,
-- which consist of libraries and sample code for various programming
-- languages and platforms (Java, Ruby, .NET, iOS, Android, etc.). The SDKs
-- provide a convenient way to create programmatic access to STS. For
-- example, the SDKs take care of cryptographically signing requests,
-- managing errors, and retrying requests automatically. For information
-- about the AWS SDKs, including how to download and install them, see the
-- <http://aws.amazon.com/tools/ Tools for Amazon Web Services page>.
--
-- For information about setting up signatures and authorization through
-- the API, go to
-- <http://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html Signing AWS API Requests>
-- in the /AWS General Reference/. For general information about the Query
-- API, go to
-- <http://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html Making Query Requests>
-- in /Using IAM/. For information about using security tokens with other
-- AWS products, go to
-- <http://docs.aws.amazon.com/STS/latest/UsingSTS/UsingTokens.html Using Temporary Security Credentials to Access AWS>
-- in /Using Temporary Security Credentials/.
--
-- If you\'re new to AWS and need additional technical information about a
-- specific AWS product, you can find the product\'s technical
-- documentation at <http://aws.amazon.com/documentation/>.
--
-- __Endpoints__
--
-- The AWS Security Token Service (STS) has a default endpoint of
-- https:\/\/sts.amazonaws.com that maps to the US East (N. Virginia)
-- region. Additional regions are available, but must first be activated in
-- the AWS Management Console before you can use a different region\'s
-- endpoint. For more information about activating a region for STS see
-- <http://docs.aws.amazon.com/STS/latest/UsingSTS/sts-enableregions.html Activating STS in a New Region>
-- in the /Using Temporary Security Credentials/ guide.
--
-- For information about STS endpoints, see
-- <http://docs.aws.amazon.com/general/latest/gr/rande.html#sts_region Regions and Endpoints>
-- in the /AWS General Reference/.
--
-- __Recording API requests__
--
-- STS supports AWS CloudTrail, which is a service that records AWS calls
-- for your AWS account and delivers log files to an Amazon S3 bucket. By
-- using information collected by CloudTrail, you can determine what
-- requests were successfully made to STS, who made the request, when it
-- was made, and so on. To learn more about CloudTrail, including how to
-- turn it on and find your log files, see the
-- <http://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html AWS CloudTrail User Guide>.
module Network.AWS.STS
    ( module Export
    ) where

import           Network.AWS.STS.AssumeRole                 as Export
import           Network.AWS.STS.AssumeRoleWithSAML         as Export
import           Network.AWS.STS.AssumeRoleWithWebIdentity  as Export
import           Network.AWS.STS.DecodeAuthorizationMessage as Export
import           Network.AWS.STS.GetFederationToken         as Export
import           Network.AWS.STS.GetSessionToken            as Export
import           Network.AWS.STS.Types                      as Export
import           Network.AWS.STS.Waiters                    as Export